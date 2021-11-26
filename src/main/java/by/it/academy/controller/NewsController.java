package by.it.academy.controller;

import by.it.academy.entity.News;
import by.it.academy.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

    @RequestMapping("/home")
    public String homePage(Model model) {
        List<News> allNews = newsService.getAllNews();
        model.addAttribute("listNews", allNews);
        return "home_page";
    }

    @GetMapping("/readSelected")
    public String readSelectedNews(@RequestParam("newsId") int id, Model model) {
        model.addAttribute("news", newsService.getNews(id));
        return "read_page";
    }

    @GetMapping("/newsFormAdd")
    public String goToFormAdd(Model model) {
        model.addAttribute("news", new News());
        return "form_page";
    }

    @PostMapping("/saveNews")
    public String createNews(@Valid @ModelAttribute("news") News news, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "form_page";
        } else {
            newsService.saveNews(news);
            return "redirect:/news/home";
        }
    }

    @GetMapping("/newsFormUpdate")
    public String updateCurrentNews(@RequestParam("newsId") int id, Model model){
        model.addAttribute("news",newsService.getNews(id));
        return "form_page";
    }

    @GetMapping("/deleteSelected")
    public String deleteNews(@RequestParam("newsId") int id){
        newsService.deleteNews(id);
        return "redirect:/news/home";
    }

}
