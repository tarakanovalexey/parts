package com.javarush.parts.controller;

import com.javarush.parts.domain.Part;
import com.javarush.parts.repo.PartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class MainController {
    @Autowired
    PartRepository partRepository;

    public String countComputersAvailableToBuild(){
        int counter = 0;
        for (Part each: partRepository.findAll()){
            if (each.isRequired()) {
                if (counter == 0)
                    counter = each.getQuantity();
                if (counter > each.getQuantity())
                    counter = each.getQuantity();
            }
        }
        return String.valueOf(counter);
    }

    @GetMapping("/")
        public String index(
                Model model,
                @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
                ){
        Page<Part> page = partRepository.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("url", "/");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
        }

    @PostMapping("/add")
        public String add(
                @RequestParam String partName,
                @RequestParam Integer quantity,
                @RequestParam(value = "isRequired", required=false) String isRequired,
                @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
                Model model
    ){
        boolean is_required;
        if (isRequired != null)
            is_required = true;
        else is_required = false;
        Part part = new Part(partName, quantity, is_required);
        partRepository.save(part);
        Page<Part> page = partRepository.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("url", "/");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
    }

    @PostMapping("/delete")
    public String delete(
            Model model,
            @RequestParam Integer search_id,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ){
        partRepository.deleteById(search_id);
        Page<Part> page = partRepository.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("url", "/");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
    }

    @PostMapping("/search")
    public String delete(
            Model model,
            @RequestParam String searchname,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ){

        Page<Part> page = partRepository.findAllByPartNameLike(searchname, pageable);
        if (searchname.isEmpty()){
            page = partRepository.findAll(pageable);
        }
        model.addAttribute("page", page);
        model.addAttribute("url", "/");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
    }

    @GetMapping("/changeview")
    public String changeview(
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ){
        Page<Part> page = partRepository.findAllByIsRequiredIsTrue(pageable);
        model.addAttribute("page", page);
        model.addAttribute("url", "/changeview");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
    }

    @GetMapping("/changeview1")
    public String changeview1(
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ){
        Page<Part> page = partRepository.findAllByIsRequiredIsFalse(pageable);
        model.addAttribute("page", page);
        model.addAttribute("url", "/changeview1");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
    }

    @PostMapping("/edit")
    public String edit(
            Model model,
            @RequestParam Integer search_id
    ){
        Optional<Part> part = partRepository.findById(search_id);
        model.addAttribute("part", part.get());
        return "change";
    }

    @PostMapping("/editapply")
    public String editapply(
            @RequestParam Integer search_id,
            @RequestParam String partName,
            @RequestParam Integer quantity,
            @RequestParam(value = "isRequired", required=false) String isRequired,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            Model model
    ){
        boolean is_required;
        if (isRequired != null)
            is_required = true;
        else is_required = false;
        Optional<Part> part = partRepository.findById(search_id);
        part.get().setPartName(partName);
        part.get().setQuantity(quantity);
        part.get().setRequired(is_required);
        Part newpart = part.get();
        partRepository.deleteById(search_id);
        partRepository.save(newpart);
        Page<Part> page = partRepository.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("url", "/");
        model.addAttribute("countCompToBuild", countComputersAvailableToBuild());
        return "index";
    }

}
