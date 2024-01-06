package chessclubgui;

/* @author AlecBp */
public class MemberManager {

    private int nextAvailableId;
    private int maxMembers;
    private int numMembers;
    private Member[] membersList;

    public MemberManager(int maxMembers) {
        nextAvailableId = 0;
        this.maxMembers = maxMembers;
        this.numMembers = 0;
        membersList = new Member[this.maxMembers];
    }

    public boolean addMember(String fName, String lName) {
        if (numMembers < maxMembers) {
            membersList[numMembers++] = new Member(nextAvailableId++, fName, lName);
            return true;
        }
        return false;
    }

    public Member addMemberAndReturnRef(String fName, String lName) {
        if (numMembers < maxMembers) {
            Member temp = new Member(nextAvailableId++, fName, lName);
            membersList[numMembers++] = temp;
            return temp;
        }
        return null;
    }

    public boolean deleteMember(int targetId) {
        int idx = getMemberIndex(targetId);
        if (idx != -1) {
            membersList[idx] = membersList[numMembers - 1];
            numMembers--;
            return true;
        }
        return false;
    }

    public boolean addLossToMember(int targetId) {
        int idx = getMemberIndex(targetId);
        if (idx != -1) {
            membersList[idx].addLoss();
            return true;
        }
        return false;
    }

    public boolean addWinToMember(int targetId) {
        int idx = getMemberIndex(targetId);
        if (idx != -1) {
            membersList[idx].addWin();
            return true;
        }
        return false;
    }

    private int getMemberIndex(int targetId) {
        for (int i = 0; i < numMembers; i++) {
            if (membersList[i].getId() == targetId) {
                return i;
            }
        }
        return -1;
    }

    public Member getMemberWithId(int id) {
        int idx = getMemberIndex(id);
        if (idx != -1) {
            return membersList[idx];
        }
        return null;
    }

    public String[][] getMembersProperties() {
        // number of properties = 7
        String[][] data = new String[numMembers][7];
        for (int i = 0; i < numMembers; i++) {
            data[i] = membersList[i].getProperties();
        }
        return data;
    }

    @Override
    public String toString() {
        String s = "---- CHESS CLUB ----";
        for (int i = 0; i < numMembers; i++) {
            s += membersList[i];
        }
        return s;
    }
}
