class PostImagesController < ApplicationController
	def new #画像投稿画面を表示する
		@post_image = PostImage.new
	end
	def create #投稿された画像を保存する
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
			redirect_to post_images_path
		else
			render :new
			# renderはアクション名。同じコントローラ内の別のビューを表示できる。post_image#new指定している状態。
			# redirect_toではHTTPリクエストを送ってルーティングから処理が行われるが、
			# renderではコントローラ内のビューなら直接指定できる。

		end
	end
	def index #投稿画像をリスト表示する画面を表示する
		@post_images = PostImage.page(params[:page]).reverse_order
	end
	def show #投稿画像の詳細画面を表示する
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new
	end
	def destroy
		@post_image = PostImage.fint(params[:id])
		@post_image.destroy
		redirect_to post_images_path
	end

	private
	def post_image_params
		params.require(:post_image).permit(:shop_name, :image, :caption)
	end
end
