package com.laurentiuspilca.ssia.config;

import java.util.Arrays;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.test.context.support.WithSecurityContextFactory;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class SecurityContextFactory
        implements WithSecurityContextFactory<MockCustomUser> {

    @Override
    public SecurityContext createSecurityContext(MockCustomUser mockCustomUser) {
        SecurityContext context = SecurityContextHolder.createEmptyContext();

        Collection<? extends GrantedAuthority > authorities = //List.of(() -> "read");
                Collections.unmodifiableList(Arrays.asList(() -> "read"));
        String clientId = "client_id";

        Map m = new HashMap(); // for Java 8
        m.put(clientId, clientId); // for Java 8
        OAuth2User principal = new DefaultOAuth2User(authorities, //Map.of(clientId, clientId), clientId);
                m, clientId);

        //var a = new OAuth2AuthenticationToken(principal, authorities, clientId);
        OAuth2AuthenticationToken a = new OAuth2AuthenticationToken(principal, authorities, clientId);
        context.setAuthentication(a);
        return context;
    }

}
