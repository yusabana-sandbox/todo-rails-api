require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:todo)
  }

  let(:invalid_attributes) {
    attributes_for(:todo).merge(title: "")
  }

  describe "GET #index" do
    it "assigns all todos as @todos" do
      todo = create(:todo)
      get :index, params: {}

      expect(response).to be_ok
      expect(assigns(:todos)).to eq([todo])
    end
  end

  describe "GET #show" do
    it "assigns the requested todo as @todo" do
      todo = create(:todo)
      get :show, params: {id: todo.to_param}
      expect(assigns(:todo)).to eq(todo)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Todo" do
        expect {
          post :create, params: valid_attributes
        }.to change(Todo, :count).by(1)
      end

      it "assigns a newly created todo as @todo" do
        post :create, params: valid_attributes
        expect(assigns(:todo)).to be_a(Todo)
        expect(assigns(:todo)).to be_persisted
      end

      it "created todo" do
        post :create, params: valid_attributes
        expect(response).to be_created
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved todo as @todo" do
        post :create, params: invalid_attributes
        expect(assigns(:todo)).to be_a_new(Todo)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:update_attributes) {
        valid_attributes.merge(title: 'update_title')
      }

      it "updates the requested todo" do
        todo = create(:todo)
        put :update, params: update_attributes.merge({id: todo.to_param})
        todo.reload
        expect(assigns(:todo).title).to eq 'update_title'
      end

      it "assigns the requested todo as @todo" do
        todo = Todo.create! valid_attributes
        put :update, params: valid_attributes.merge({id: todo.to_param})
        expect(assigns(:todo)).to eq(todo)
      end

      it "update successfully" do
        todo = Todo.create! valid_attributes
        put :update, params: valid_attributes.merge({id: todo.to_param})
        expect(response).to be_ok
      end
    end

    context "with invalid params" do
      it "assigns the todo as @todo" do
        todo = Todo.create! valid_attributes
        put :update, params: {id: todo.to_param, todo: invalid_attributes}
        expect(assigns(:todo)).to eq(todo)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested todo" do
      todo = Todo.create! valid_attributes
      expect {
        delete :destroy, params: {id: todo.to_param}
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      todo = Todo.create! valid_attributes
      delete :destroy, params: {id: todo.to_param}
      expect(response).to be_no_content
    end
  end
end
