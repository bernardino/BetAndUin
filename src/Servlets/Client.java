package Servlets;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import Server.CMInterface;
import Server.MMInterface;
import Server.MenuInterface;

import ClientRMI.ClientInterface;


@SuppressWarnings("serial")
public class Client extends UnicastRemoteObject implements ClientInterface{
	private String user,password;
	private MenuInterface m = null;
	private CMInterface cc = null;
	private MMInterface mm = null;
	
	public Client(String user,String pass,MenuInterface m, CMInterface cc, MMInterface mm) throws RemoteException{
		this.user = user;
		this.password = pass;
		this.mm = mm;
		this.cc = cc;
		this.m = m;
	}
	

	public void receiveMessage(String s) throws RemoteException {
		Messages.sendMessage(s, user);
	}

	public String getUser() throws RemoteException {
		return user;
	}

	public int ping() throws RemoteException {
		return 0;
	}
	
	public void sendMessage(String destination, String message) throws RemoteException{
		mm.sendMessage(user, destination, message);
	}
	
	public void sendMessageAll(String message) throws RemoteException{
		mm.sendMessageAll(user, message);
	}
	
	public String getCredits() throws RemoteException{
		return cc.showCredits(user);
	}


	public void resetCredits() throws RemoteException{
		cc.resetCredits(user);
	}
	
	public String[] getOnlineUsers(){
		String aux = "";
		String[] result = null;
		
		try {
			aux = cc.showOnlineUsers(user);
			result = aux.split("\n");
			return result;
			
		} catch (RemoteException e) {
			System.out.println("Could not connect to server!\nPlease wait.");
			return null;
		}
	}
	
	public String bet(int code, String result, int credits){
		String output;
		
		try {
			output = cc.bet(user, code, result, credits);
		} catch (RemoteException e) {
			output="Could not connect to server! Please wait.";
		}
		return output;
	}
	
	public String[] getGames(){
		String[] result;
		try {
			result = cc.currentMatches().split("\n");
		} catch (RemoteException e) {
			result=new String[1];
			result[0] = "Could not connect to server! Please wait.";
		}
		return result;
	}
	
	public String toString(){
		try {
			return "Hello, "+user+ " (" + getCredits() + " credits)";
		} catch (RemoteException e) {
			
		}
		return "";
	}
	
	public void logout() throws RemoteException{
		m.unsubscribe(user);
	}
}
