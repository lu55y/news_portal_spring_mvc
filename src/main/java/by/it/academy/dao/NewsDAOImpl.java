package by.it.academy.dao;

import by.it.academy.entity.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Repository
public class NewsDAOImpl implements NewsDAO {
    private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<News> getAllNews() {
        Session session = sessionFactory.getCurrentSession();
        String sql="from News order by id";
        Query<News> newsQuery = session.createQuery(sql,News.class);
        return newsQuery.getResultList();
    }

    @Override
    public News getNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(News.class,id);
    }

    @Override
    public void saveNews(News news) {
        Session currentSession = sessionFactory.getCurrentSession();
        news.setDate(getDate());
        currentSession.saveOrUpdate(news);
    }

    @Override
    public void deleteNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("delete from News WHERE id= :idNews");
        query.setParameter("idNews",id);
        query.executeUpdate();
    }

    private String getDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
        Timestamp date=new Timestamp(new Date().getTime());
        return dateFormat.format(date);
    }
}
