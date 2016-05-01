package ua.anah0ret.pointslist.service;

import ua.anah0ret.pointslist.model.Point;

import java.util.List;

public interface PointService {
    public void addPoint(Point point);

    public void updatePoint(Point point);

    public void removePoint(int id);

    public Point getPoint(int id);

    public List<Point> listPoints();

    public List<Point> listPoints(String query);
}
