package bulletinBoard.dto;

public class Reply {
    private int idx;
    private String id;
    private String reply;

    public Reply(int idx, String id, String reply) {
        this.idx = idx;
        this.id = id;
        this.reply = reply;
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
}

