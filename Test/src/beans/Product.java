package beans;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity
@Table(name="articletable")
public class Product 
{
	@Id
	private int aid;
	@Column(name="aname")
    private String name;
    private String description;
    @Transient
    private List<MultipartFile> images;
    @Transient
    private List<MultipartFile> documents;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getName() {
		return name;
	}
	public void setName(String aname) {
		this.name = aname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<MultipartFile> getImages() {
		return images;
	}
	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}
	public List<MultipartFile> getDocuments() {
		return documents;
	}
	public void setDocuments(List<MultipartFile> documents) {
		this.documents = documents;
	}
    
    
}