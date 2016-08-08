require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /todos' do
    it 'return 200 without todo json(not exist todos)' do
      is_expected.to eq 200
      expect(response.body).to be_json_as(todos: [])
    end

    it 'return 200 with todos json' do
      todos = create_list(:todo, 2)
      expected = todos.each_with_object([]) do |todo, memo|
        memo << {id: todo.id, title: todo.title, body: todo.body}
      end

      is_expected.to eq 200
      expect(response.body).to be_json_as(todos: expected)
    end
  end


  describe 'GET /todos/:id' do
    context "with valid params" do
      let!(:todo) { create(:todo) }
      let(:id) { todo.id }

      it 'return 200, with todo' do
        is_expected.to eq 200
        expect(response.body).to be_json_as(
          todo: {id: todo.id, title: todo.title, body: todo.body}
        )
      end
    end

    context "with invalid params" do
      let(:id) { 'invalid' }

      it 'return 500, not exist todos at all' do
        expect {
          is_expected
        }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'return 500, retrieve to exist id' do
        expect {
          create(:todo)
          is_expected
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


  describe 'POST /todos' do
    context "with valid params" do
      let(:create_attributes) { attributes_for(:todo) }

      it 'return 201 and create todo' do
        params['todo'] = create_attributes
        is_expected.to eq 201
        expect(response.body).to be_json_including(
          todo: {title: create_attributes[:title], body: create_attributes[:body]}
        )
      end
    end

    context "with valid params" do
      pending 'still does not exist invalid params'
    end
  end

  describe 'PATCH /todos/:id' do
    let!(:todo) { create(:todo) }
    let(:id) { todo.id }

    context "with valid params" do
      let(:update_attributes) { {title: 'update_title', body: 'update_body'} }

      it 'return 200 and update todo' do
        params['todo'] = update_attributes
        is_expected.to eq 200
        expect(response.body).to be_json_as(
          todo: {id: todo.id, title: update_attributes[:title], body: update_attributes[:body]}
        )
      end
    end

    context "with invalid params" do
      context 'invalid id' do
        let(:id) { 'invalid' }

        it 'return 500, not exist todos at all' do
          expect {
            is_expected
          }.to raise_error ActiveRecord::RecordNotFound
        end

        it 'return 500, retrieve to exist id' do
          expect {
            create(:todo)
            is_expected
          }.to raise_error ActiveRecord::RecordNotFound
        end
      end

      context 'invalid post params' do
        pending 'still does not exist invalid post params'
      end
    end
  end


  describe 'DELETE /todos/:id' do
    context "with valid params" do
      let!(:todo) { create(:todo) }
      let(:id) { todo.id }

      it 'return 200 and update todo' do
        expect {
          is_expected.to eq 204
        }.to change{ Todo.count }.from(1).to(0)
      end
    end

    context "with invalid params" do
      context 'invalid id' do
        let(:id) { 'invalid' }

        it 'return 500, not exist todos at all' do
          expect {
            is_expected
          }.to raise_error ActiveRecord::RecordNotFound
        end

        it 'return 500, retrieve to exist id' do
          expect {
            create(:todo)
            is_expected
          }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

end
