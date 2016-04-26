package ua.anah0ret.pointslist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.anah0ret.pointslist.model.Point;
import ua.anah0ret.pointslist.service.PointService;

@Controller
public class PointController {
    private PointService pointService;

    @Autowired(required = true)
    @Qualifier(value = "pointService")
    public void setPointService(PointService pointService) {
        this.pointService = pointService;
    }

    @RequestMapping(value = "points", method = RequestMethod.GET)
    public String listPoints(Model model){
        model.addAttribute("point", new Point());
        model.addAttribute("listPoints", this.pointService.listPoints());
        return "points";
    }

    @RequestMapping(value = "/points/add", method = RequestMethod.POST)
    public String addPoint(@ModelAttribute("point") Point point){
        if(point.getId() == 0){
            this.pointService.addPoint(point);
        }else {
            this.pointService.updatePoint(point);
        }
        return "redirect:/points";
    }

    @RequestMapping("/remove/{id}")
    public String removePoint(@PathVariable("id") int id){
        this.pointService.removePoint(id);
        return "redirect:/points";
    }

    @RequestMapping("/edit/{id}")
    public String editPoint(@PathVariable("id") int id, Model model){
        model.addAttribute("point", this.pointService.getPoint(id));
        model.addAttribute("listPoints", this.pointService.listPoints());
        return "points";
    }

    @RequestMapping("/pointdata/{id}")
    public String pointData(@PathVariable("id") int id, Model model){
        model.addAttribute("point", this.pointService.getPoint(id));
        return "pointdata";
    }
}