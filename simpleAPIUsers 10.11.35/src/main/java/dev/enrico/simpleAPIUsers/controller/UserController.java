package dev.enrico.simpleAPIUsers.controller;

import dev.enrico.simpleAPIUsers.model.User;
import dev.enrico.simpleAPIUsers.model.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    UserRepository repository;

    @GetMapping
    public List<User> getAllUsers() {
        return repository.findAll(Sort.by("username"));
    }

    @GetMapping("/{id}")
    public User getUsersById(@PathVariable("id") Long id) {
        return repository.findById(id).get();
    }

    @PostMapping
    public User insertUser(@RequestBody User user) { return repository.save(user);
    }

    @PutMapping("/{id}")
    public User updateUser(@RequestBody User user) {
        if (user.getId() != null) {
            return repository.save(user);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public String excluirUser(@PathVariable("id") Long id) {
        if (id != null) {
            repository.deleteById(id);
            return "Usuário excluído";
        }
        return null;
    }
}
