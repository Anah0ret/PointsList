package ua.anah0ret.pointslist.model;

import javax.persistence.*;

@Entity
@Table(schema = "test", name = "pointslist")
public class Point {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "pointname")
    private String pointName;

    @Column(name = "pointcontext")
    private String pointContext;

    @Column(name = "pointclose")
    private boolean pointClose;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName=pointName;
    }

    public String getPointContext() {
        return pointContext;
    }

    public void setPointContext(String pointContext) {
        this.pointContext=pointContext;
    }

    public boolean getPointClose() {
        return pointClose;
    }

    public void setPointClose(boolean pointClose) {
        this.pointClose=pointClose;
    }

    @Override
    public String toString() {
        return "Point{" +
                "id=" + id +
                ", pointName='" + pointName + '\'' +
                ", pointContext='" + pointContext + '\'' +
                ", pointClose=" + pointClose +
                '}';
    }
}
