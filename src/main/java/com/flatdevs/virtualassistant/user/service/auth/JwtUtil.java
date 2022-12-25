package com.flatdevs.virtualassistant.user.service.auth;

import com.flatdevs.virtualassistant.user.entity.UserEntity;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;

public class JwtUtil {
    private final Key secretKey;
    private final long tokenExpiryTime;

    public JwtUtil(String secretKey, long tokenExpiryTime) {
        byte[] keyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
        this.secretKey = Keys.hmacShaKeyFor(keyBytes);
        this.tokenExpiryTime = tokenExpiryTime;
    }

    public Claims getTokenClaims(String token) {
        return Jwts.parserBuilder().setSigningKey(secretKey).build().parseClaimsJws(token).getBody();
    }

    public String generateToken(String subject) {
        return Jwts.builder().setSubject(subject).setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + tokenExpiryTime * 1000))
                .signWith(SignatureAlgorithm.HS512, secretKey).compact();
    }

    public Boolean isTokenValid(String token, UserEntity user) {
        Claims claims = getTokenClaims(token);
        return (claims.getSubject().equals(user.getUsername()) && claims.getExpiration().after(new Date()));
    }
}
