class PagesController < ApplicationController
layout "page"

def home_page
	@page = Page.find_by_slug("home")
	@page_blocks = @page.blocks.all
	@page_blocks_top = @page_blocks.where(:block_position => 'Top')
	@page_blocks_bottom = @page_blocks.where(:block_position => 'Bottom')
	@page_blocks_footer = @page_blocks.where(:block_position => 'Footer')
	@page_blocks_left = @page_blocks.where(:block_position => 'Left')
	@page_blocks_right = @page_blocks.where(:block_position => 'Right')
	@page_title = custom_meta_title
	@page_description = custom_meta_description
	@page_keywords = custom_meta_keywords
	
end

def show
	@page = Page.friendly.find(params[:id])
	@page_blocks = @page.blocks.all
	@page_blocks_top = @page_blocks.where(:block_position => 'Top')
	@page_blocks_bottom = @page_blocks.where(:block_position => 'Bottom')
	@page_blocks_footer = @page_blocks.where(:block_position => 'Footer')
	@page_blocks_left = @page_blocks.where(:block_position => 'Left')
	@page_blocks_right = @page_blocks.where(:block_position => 'Right')
	@page_title = custom_meta_title
	@page_description = custom_meta_description
	@page_keywords = custom_meta_keywords
	
	if  @page.slug == "home"
		redirect_to root_path
	end
end

private
	def custom_meta_title
		if @page.metum.present?
			@page.metum.meta_title
	  else
	  	@page.title
	  end
	end
	
	def custom_meta_description
		if @page.metum.present?
			@page.metum.meta_description
	  else
	  	@page.body.to_s
	  end
	end
	
	def custom_meta_keywords
		if @page.metum.present?
			@page.metum.meta_keyword
	  end
	end

end