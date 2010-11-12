package Server;
import java.rmi.Remote;
import java.rmi.RemoteException;

public interface CMInterface extends Remote {
	public String resetCredits(String user) throws RemoteException;
	public String showCredits(String user) throws RemoteException;
	public String showOnlineUsers(String user) throws RemoteException;
	public String bet(String user, int code, String result, int credits) throws RemoteException;
	public String currentMatches() throws RemoteException;
	public String getLastMessages(String user) throws RemoteException;
	public String getPendingMessages(String user) throws RemoteException;
}