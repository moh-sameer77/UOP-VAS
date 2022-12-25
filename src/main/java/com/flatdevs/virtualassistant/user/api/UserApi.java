package com.flatdevs.virtualassistant.user.api;

import com.flatdevs.virtualassistant.contract.Result;
import com.flatdevs.virtualassistant.user.model.User;
import com.flatdevs.virtualassistant.user.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api/user")
public class UserApi
{
    private final UserService userService;

    public UserApi(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    public ResponseEntity<Result> register(@RequestBody User user)
    {
        return ResponseEntity.ok().body(userService.register(user));
    }

    @PostMapping("/login")
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    public ResponseEntity<Result> login(@RequestBody User user)
    {
        return ResponseEntity.ok().body(userService.login(user));
    }
}
