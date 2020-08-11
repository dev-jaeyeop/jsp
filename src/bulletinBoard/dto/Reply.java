package bulletinBoard.dto;

public class Reply {
    private int idx;
    private String id;
    private String reply;
    private String date;

    public Reply(int idx, String id, String reply, String date) {
        this.idx = idx;
        this.id = id;
        this.reply = reply;
        this.date = date;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}

