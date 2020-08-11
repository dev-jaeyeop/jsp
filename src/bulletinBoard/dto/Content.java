package bulletinBoard.dto;

public class Content {
    private int idx;
    private String id;
    private String title;
    private String content;
    private String date;

    public Content(int idx, String id, String title, String content, String date) {
        this.idx = idx;
        this.id = id;
        this.title = title;
        this.content = content;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
