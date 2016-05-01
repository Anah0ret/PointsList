package ua.anah0ret.pointslist.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ua.anah0ret.pointslist.model.Point;

import java.util.List;

@Repository
public class PointDaoImpl implements PointDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addPoint(Point point) {
        Session session=this.sessionFactory.getCurrentSession();
        session.persist(point);
    }

    @Override
    public void updatePoint(Point point) {
        Session session=this.sessionFactory.getCurrentSession();
        session.update(point);
    }

    @Override
    public void removePoint(int id) {
        Session session=this.sessionFactory.getCurrentSession();
        Point point=(Point) session.get(Point.class, id);
        if(point!=null) session.delete(point);
    }

    @Override
    public Point getPoint(int id) {
        Session session=this.sessionFactory.getCurrentSession();
        return (Point)session.get(Point.class, id);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Point> listPoints() {
        Session session=this.sessionFactory.getCurrentSession();
        return session.createQuery("from ua.anah0ret.pointslist.model.Point").list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Point> listPoints(String query) {
        Session session=this.sessionFactory.getCurrentSession();
        if(query.equals("close")) return session.createQuery("from ua.anah0ret.pointslist.model.Point where pointClose=true").list();
        else if(query.equals("open")) return session.createQuery("from ua.anah0ret.pointslist.model.Point where pointClose=false").list();
            else return session.createQuery("from ua.anah0ret.pointslist.model.Point").list();
    }
}
