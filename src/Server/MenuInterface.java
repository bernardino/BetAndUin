package Server;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ClientRMI.ClientInterface;


public interface MenuInterface extends Remote {
	public String login(String username, String password) throws RemoteException;
	public String register(String username, String password, String email) throws RemoteException;
	public void subscribe(String user, ClientInterface c) throws RemoteException;
	public void unsubscribe(String user) throws RemoteException;
}