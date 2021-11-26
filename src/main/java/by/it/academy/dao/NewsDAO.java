package by.it.academy.dao;

import by.it.academy.entity.News;

import java.util.List;

public interface NewsDAO {

    public List<News> getAllNews();

    public News getNews(int id);

    public void saveNews(News news);

    public void deleteNews(int id);
}
