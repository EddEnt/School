package chessclubgui;

/* @author AlecBp */
public class Member {

    private int memberId;
    private String fName;
    private String lName;
    private int numberOfGames;
    private int wins;

    public Member(int memberId, String fName, String lName) {
        this.memberId = memberId;
        this.fName = fName;
        this.lName = lName;
        wins = 0;
        numberOfGames = 0;
    }

    public int getId() {
        return memberId;
    }

    public void addWin() {
        wins++;
        numberOfGames++;
    }

    public void addLoss() {
        numberOfGames++;
    }

    public String getFName() {
        return fName;
    }

    public String getLName() {
        return lName;
    }

    public int getWins() {
        return wins;
    }

    public int getNumberOfGames() {
        return numberOfGames;
    }

    public int getLosses() {
        return numberOfGames - wins;
    }

    public double getWLRatio() {
        double losses = getLosses();
        return (numberOfGames > 0 ? wins / (losses == 0 ? 1 : losses) : 0);
    }

    public String[] getProperties() {
        String[] data = {
            Integer.toString(memberId),
            fName,
            lName,
            Integer.toString(numberOfGames),
            Integer.toString(wins),
            Integer.toString(getLosses()),
            Double.toString(getWLRatio())
        };
        return data;
    }

    @Override
    public String toString() {
        String s = "";
        s += "ID: " + memberId + "\n";
        s += "Name: " + fName + " " + lName + "\n";
        s += "Number of games: " + numberOfGames + "\n";
        s += "Wins: " + wins + "\n";
        s += "Losses: " + (numberOfGames - wins) + "\n";
        s += "Winrate: " + (getWLRatio()) + "\n";
        return s;
    }
}
