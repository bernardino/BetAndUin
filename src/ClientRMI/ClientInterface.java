package ClientRMI;
import java.rmi.*;

public interface ClientInterface extends Remote {
	public void receiveMessage(String s) throws RemoteException;
	public String getUser() throws RemoteException;
	public int ping() throws RemoteException;
}
