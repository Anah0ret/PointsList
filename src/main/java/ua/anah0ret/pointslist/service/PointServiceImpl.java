package ua.anah0ret.pointslist.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.anah0ret.pointslist.dao.PointDao;
import ua.anah0ret.pointslist.model.Point;

import java.util.List;

@Service
public class PointServiceImpl implements PointService{
    private PointDao pointDao;

    public void setPointDao(PointDao pointDao) {
        this.pointDao = pointDao;
    }

    @Override
    @Transactional
    public void addPoint(Point point) {
        this.pointDao.addPoint(point);
    }

    @Override
    @Transactional
    public void updatePoint(Point point) {
        this.pointDao.updatePoint(point);
    }

    @Override
    @Transactional
    public void removePoint(int id) {
        this.pointDao.removePoint(id);
    }

    @Override
    @Transactional
    public Point getPoint(int id) {
        return this.pointDao.getPoint(id);
    }

    @Override
    @Transactional
    public List<Point> listPoints() {
        return this.pointDao.listPoints();
    }
}
