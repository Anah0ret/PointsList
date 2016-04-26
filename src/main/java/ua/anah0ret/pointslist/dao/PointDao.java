package ua.anah0ret.pointslist.dao;

import ua.anah0ret.pointslist.model.Point;

import java.util.List;

/**
 * Created by Admin on 25.04.2016.
 */
public interface PointDao {
    public void addPoint(Point point);

    public void updatePoint(Point point);

    public void removePoint(int id);

    public Point getPoint(int id);

    public List<Point> listPoints();
}
