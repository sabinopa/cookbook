class MyListsController < ApplicationController 
  def new
    @my_list = MyList.new
  end

  def create
    list_params = params.require(:my_list).permit(:name)
    @my_list = current_user.my_list.build(list_params)
    if @my_list.save! 
      redirect_to root_path, notice: 'Nova lista salva com sucesso!'
    end
    flash.now[:alert] = 'Não foi possível salvar nova lista'
  end
end