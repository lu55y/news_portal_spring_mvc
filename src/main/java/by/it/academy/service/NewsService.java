package by.it.academy.service;

import by.it.academy.entity.News;

import java.util.List;

public interface NewsService {
    public List<News> getAllNews();
    public News getNews(int id);
    public void saveNews(News news);
    public void deleteNews(int id);
}
