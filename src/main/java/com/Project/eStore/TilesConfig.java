package com.Project.eStore;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Configuration
public class TilesConfig {

	@Bean
	public ViewResolver getViewResolver() {
		UrlBasedViewResolver r = new UrlBasedViewResolver();
		r.setViewClass(TilesView.class);
		return r;
	}
	
	@Bean
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer t = new TilesConfigurer();
		t.setDefinitions("/WEB-INF/tiles.xml");
		return t;
	}
}
