class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
  end
  def show
    @task = Task.find(params[:id])
  end
  def create
    Task.create(blog_params)
    redirect_to new_blog_path
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end
  def show
   # @task = Task.find(params[:id])
  end
  def edit
    # @task = Task.find(params[:id])
  end
  def update
    # @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  private
  def task_params
    params.require(:task).permit(:content)
  end
  def set_blog
    @task = Task.find(params[:id])
  end

end
