package jspbook.pr32;
import java.util.ArrayList;

public class AddrManager {
	private ArrayList<AddrBean> addrlist;
	
	public AddrManager(){
		addrlist = new ArrayList<AddrBean>();
	}
	public ArrayList<AddrBean> getAddrList(){
		return addrlist;
	}
	public void add(AddrBean ab) {
		addrlist.add(ab);
	}

}
