package cn.itcast.entity;

import java.io.Serializable;

public class Job implements Serializable{
	private static final long serialVersionUID = -6671976735268442663L;

	private String jobId;

    private String jobTitle;

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId == null ? null : jobId.trim();
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle == null ? null : jobTitle.trim();
    }
}