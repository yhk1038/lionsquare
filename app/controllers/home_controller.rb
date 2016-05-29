class HomeController < ApplicationController
  #before_action :require_login, only: [:write, :destroy, :update, :reply_write, :reply_destroy]
  
  def require_login
    unless user_signed_in?
      flash[:error] = "로그인이 필요한 서비스입니다."
      #redirect_to '/users/sign_in'
    end
  end
  
  def main
    @postings= Posting.all.reverse
  end
  
  def board
    if params[:id] != nil
      @one_board = Board.find(params[:id])
    elsif params[:admin] == "110"
      new = Board.new
      new.name = ""
      new.category_id = 1
      new.description = ""
      new.save
      
      @one_board = Board.find(new.id)
      redirect_to "/home/board/#{new.id}?admin=10"
    end
    
  end
  
  #관리자계정 게시판변경
  def edit
      one_board             = Board.find(params[:id])
      if params[:for] == "name"
        one_board.name        = params[:name]
        one_board.category_id = params[:category_id]
      elsif params[:for] == "description"
        one_board.description = params[:description]
      end
      one_board.save
      redirect_to :back
  end
  
  def delete_board
    b = Board.find(params[:id])
    b.delete
    
    redirect_to :back
  end
  
  def board2
    @one_board = Board.find(params[:id])
  end
  
  def posting
    @posting = Posting.find(params[:id])
    @replies = @posting.replies.all
  end
  
  # 게시물 글쓰기
  def write
    
  end
  
  def write_save
    new_posting = Posting.new
    
    if user_signed_in?
      new_posting.title = params[:title]
      new_posting.content = params[:content]
      new_posting.user_id = current_user.id
      new_posting.save
      
      redirect_to :back
      return
      
    
    else
      flash[:error] = "회원이 아닙니다."
      redirect_to :back
      return
    end
    
  end
  
  #게시물 글삭제
  def destroy
    one_posting = Posting.find(params[:id])
    one_posting.destroy
    redirect_to :back
    # unless current_user.id == one_posting.user_id
    #   flash[:error] = "본인이 작성한 게시글만 삭제할 수 있습니다."
    #   redirect_to :back
    #   return
    # else
    #   one_posting.destroy
    #   redirect_to :back
    #   return
    # end
  end
  
  #게시물 업데이트
  def update
    one_posting = Posting.find(params[:id])
    
    unless current_user.id == one_posting.user_id
      flash[:error] = "본인이 작성한 게시글만 수정할 수 있습니다."
      redirect_to :back
      return
    else
      one_posting.content = params[:content]
      one_posting.save
      redirect_to :back
      return
    end
  end
  
  #댓글 글쓰기
  def reply_write
    new_reply = Reply.new
    
    #if user_signed_in?
      new_reply.content = params[:content]
      new_reply.posting_id = params[:id]
      new_reply.user_id = current_user.id
      new_reply.save
      
      #redirect_to :back
      #return
    #else
    #  flash[:error] = "회원이 아닙니다"
    #  redirect_to :back
    #end
  end
  
  #댓글 글삭제
  def reply_destroy
    one_reply = Reply.find(params[:id])
    one_reply.destroy
    redirect_to :back
    
    #unless current_user.id == one_reply.user_id
    #  flash[:error] = "본인이 작성한 댓글만 삭제할 수 있습니다."
    #  redirect_to :back
    #  return
    #else
    #  one_reply.destroy
    #  redirect_to :back
    #  return
    #end
  end
  
  #잠시 쓰겠습니다.
  def middle
      @postings= Posting.all.reverse 
      
  end
end
