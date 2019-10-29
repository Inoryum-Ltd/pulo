class PagesController < ApplicationController
layout "page"

def show
	@page = Page.friendly.find(params[:id])
	@page_blocks = @page.blocks.all
	@page_blocks_top = @page_blocks.where(:block_position => 'Top')
	@page_blocks_bottom = @page_blocks.where(:block_position => 'Bottom')
	@page_blocks_footer = @page_blocks.where(:block_position => 'Footer')
	@page_blocks_left = @page_blocks.where(:block_position => 'Left')
	@page_blocks_right = @page_blocks.where(:block_position => 'Right')
	@page_title = @page.title
	@page_description = @page.body.to_s
end

end