package vn.edu.hcmuaf.fit.doancuoiki.model;

import java.sql.Time;

public class PageContent {
    private int id;
    private String contentKey;
    private int contentType;
    private String contentValue;
    private Time lastUpdated;

    public PageContent(int id, String contentKey, int contentType, String contentValue, Time lastUpdated) {
        this.id = id;
        this.contentKey = contentKey;
        this.contentType = contentType;
        this.contentValue = contentValue;
        this.lastUpdated = lastUpdated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContentKey() {
        return contentKey;
    }

    public void setContentKey(String contentKey) {
        this.contentKey = contentKey;
    }

    public int getContentType() {
        return contentType;
    }

    public void setContentType(int contentType) {
        this.contentType = contentType;
    }

    public String getContentValue() {
        return contentValue;
    }

    public void setContentValue(String contentValue) {
        this.contentValue = contentValue;
    }

    public Time getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Time lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
