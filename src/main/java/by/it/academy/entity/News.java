package by.it.academy.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "news")
public class News implements Serializable {
    private static final Long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", updatable = false)
    private int id;

    @NotNull(message = "Title can't by null or empty.")
    @Size(min = 5,max = 200, message = "The title must be between 5 and 200 symbols.")
    @Column(name = "title")
    private String title;

    @NotNull(message = "Brief can't by null or empty.")
    @Size(min = 5,max = 300, message = "The brief must be between 5 and 300 symbols.")
    @Column(name = "brief")
    private String brief;

    @NotNull(message = "Content can't by null or empty.")
    @Size(min = 5,max = 2000, message = "The content must be between 5 and 2000 symbols.")
    @Column(name = "content")
    private String content;

    @NotNull(message = "Content can't by null or empty.")
    @Size(min = 1, max = 45, message = "The author must be between 1 and 45 symbols.")
    @Column(name = "author")
    private String author;

    @Column(name = "date")
    private String date;

    public News(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        News news = (News) o;
        return id == news.id && Objects.equals(title, news.title) && Objects.equals(brief, news.brief) && Objects.equals(content, news.content) && Objects.equals(author, news.author) && Objects.equals(date, news.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, brief, content, author, date);
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", brief='" + brief + '\'' +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                ", date=" + date +
                '}';
    }
}
