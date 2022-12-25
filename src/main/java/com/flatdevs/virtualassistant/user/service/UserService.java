package com.flatdevs.virtualassistant.user.service;

import com.flatdevs.virtualassistant.contract.Result;
import com.flatdevs.virtualassistant.user.entity.UserEntity;
import com.flatdevs.virtualassistant.user.entity.UserEntity.Gender;
import com.flatdevs.virtualassistant.user.entity.UserEntity.StudentType;
import com.flatdevs.virtualassistant.user.model.User;
import com.flatdevs.virtualassistant.user.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;

import static java.util.Objects.nonNull;

@Slf4j
public class UserService {
    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public UserService(PasswordEncoder passwordEncoder, UserRepository userRepository) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
    }

    public Result register(User user) {
        try {
            if (nonNull(userRepository.findByEmail(user.getEmail()))) {
                user.setEmail("userAlreadyExists");
                user.setPassword(null);
                return Result.builder().success(false).message(user).build();
            }
            saveUser(user);
            return Result.builder().success(true).message(user).build();
        } catch (Exception e) {
            return Result.builder().success(false).build();
        }
    }

    public Result login(User user) {
        try {
            UserEntity userEntity = userRepository.findByEmail(user.getEmail());
            if (nonNull(userEntity)) {
                if(passwordEncoder.matches(user.getPassword(), userEntity.getPassword()))
                    return Result.builder().success(true).message(buildUser(userEntity)).build();
                user.setPassword("incorrectPassword");
                return Result.builder().success(false).message(user).build();
            }
            user.setEmail("userDoesNotExist");
            return Result.builder().success(false).message(user).build();
        } catch (Exception e) {
            return Result.builder().success(false).build();
        }
    }

    private User buildUser(UserEntity userEntity) {
        return User.builder()
                .dateOfBirth(userEntity.getDateOfBirth())
                .email(userEntity.getEmail())
                .studentType(userEntity.getStudentType().toString())
                .firstName(userEntity.getFirstName())
                .lastName(userEntity.getLastName()).build();
    }

    private void saveUser(User user) {
        UserEntity userEntity = new UserEntity();
        userEntity.setFirstName(user.getFirstName());
        userEntity.setLastName(user.getLastName());
        userEntity.setEmail(user.getEmail());
        userEntity.setPassword(passwordEncoder.encode(user.getPassword()));
        userEntity.setGender(Gender.valueOf(user.getGender()));
        userEntity.setStudentType(StudentType.valueOf(user.getStudentType()));
        userRepository.saveAndFlush(userEntity);
    }
}
