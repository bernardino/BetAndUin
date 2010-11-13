package Servlets;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.LinkedList;

import Server.CMInterface;
import Server.MMInterface;
import Server.MenuInterface;

import ClientRMI.ClientInterface;

@SuppressWarnings("serial")
public class Client extends UnicastRemoteObject implements ClientInterface{
	String user,password;
	MenuInterface m = null;
	CMInterface cc = null;
	MMInterface mm = null;
	
	public Client(String user,String pass, MenuInterface m, CMInterface cc, MMInterface mm ) throws RemoteException{
		this.user = user;
		this.password = pass;
		this.m = m;
		this.cc = cc;
		this.mm = mm;
	}
	
	public String getUsername(){
		return user;
	}
	
	public String login(String user, String pass) throws RemoteException{
		return m.login(user, pass);
		
	}
	
	public String register(String user, String pass, String email) throws RemoteException{
		return m.register(user,pass,email);
		
	}
	
	public void subscribe(String user, ClientInterface c) throws RemoteException{
		m.subscribe(user, c);
	}

	@Override
	public void receiveMessage(String s) throws RemoteException {
		// TODO Auto-generated method stub
		System.out.println(s);
	}

	@Override
	public String getUser() throws RemoteException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int ping() throws RemoteException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public String[] getOnlineUsers(){
		//LinkedList<String> result = new LinkedList<String>();
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
}
