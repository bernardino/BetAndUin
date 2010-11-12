package Server;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Vector;

public interface MMInterface extends Remote {
	public String sendMessage(String user, String destiny, String message) throws RemoteException;
	public void sendMessageAll(String user, String message) throws RemoteException;
	public void sendPendingMessages(String user, Vector<String> pendingMessages) throws RemoteException;
}