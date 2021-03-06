class TiposController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
  

  respond_to :html

  def index
    @tipos = Tipo.all
    respond_with(@tipos)
  end

  def show
    respond_with(@tipo)
  end

  def new
    @tipo = Tipo.new
    respond_with(@tipo)
  end

  def edit
  end

  def create
    @tipo = Tipo.new(tipo_params)
    @tipo.save
    respond_with(@tipo)
  end

  def update
    @tipo.update(tipo_params)
    respond_with(@tipo)
  end

  def destroy
    @tipo.destroy
    respond_with(@tipo)
  end

  private
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    def tipo_params
      params.require(:tipo).permit(:nome)
    end
end
