package com.flatdevs.virtualassistant.config;

import com.flatdevs.virtualassistant.user.api.UserApi;
import com.flatdevs.virtualassistant.user.repository.UserRepository;
import com.flatdevs.virtualassistant.user.service.UserService;
import com.flatdevs.virtualassistant.user.service.auth.JwtUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class AppConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JwtUtil jwtUtil(@Value("${jwt.secret-key}") String secretKey,
                           @Value("${jwt.expiry-time}") long tokenExpiryTime) {
        return new JwtUtil(secretKey, tokenExpiryTime);
    }

    @Bean
    public UserService userService(PasswordEncoder passwordEncoder, UserRepository userRepository)
    {
        return new UserService(passwordEncoder, userRepository);
    }

    @Bean
    public UserApi userApi(UserService userService) {
        return new UserApi(userService);
    }
}
