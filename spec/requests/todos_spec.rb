require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  before :each do
    user = create(:user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    headers['Authorization'] = "Bearer #{token}"
  end

  describe 'GET /todos' do
    it 'return 200 Todoが存在しない時は空の配列がレスポンスされる' do
      is_expected.to eq 200
      expect(response.body).to be_json_as(todos: [])
    end

    it 'return 200 Todoの配列がレスポンスされる' do
      todos = create_list(:todo, 2)
      expected = todos.each_with_object([]) do |todo, memo|
        memo << {id: todo.id, title: todo.title, body: todo.body}
      end

      is_expected.to eq 200
      expect(response.body).to be_json_as(todos: expected)
    end


    it 'tokenの有効期限が切れた時は401となる'
  end


  describe 'GET /todos/:id' do
    context '正しいパラメータの時' do
      let!(:todo) { create(:todo) }
      let(:id) { todo.id }

      it 'return 200 Todoが1件レスポンスされる' do
        is_expected.to eq 200
        expect(response.body).to be_json_as(
          todo: {id: todo.id, title: todo.title, body: todo.body}
        )
      end
    end

    context '不正なパラメータの時' do
      let(:id) { 'invalid' }

      it 'return exception ひとつもTodoがなくエラーがレスポンスされる' do
        expect { is_expected }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'return exception Todoが存在するがエラーがレスポンスされる' do
        create(:todo)
        expect { is_expected }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end


  describe 'POST /todos' do
    context '正しいパラメータの時' do
      let(:create_attributes) { attributes_for(:todo) }

      it 'return 201 Todoが生成される' do
        params.merge!(create_attributes)
        expect { is_expected.to eq 201 }.to change(Todo, :count).from(0).to(1)
        expect(response.body).to be_json_including(
          todo: {title: create_attributes[:title], body: create_attributes[:body]}
        )
      end
    end

    context '不正なパラメータの時' do
      context 'titleのパラメータが不正' do
        it 'return 400 params[:title]が送られない時はTodoが生成されない' do
          params.merge!({body: 'aa'})
          is_expected.to eq 400
        end

        it 'return 422 params[:title]が空の時はTodoが生成されない' do
          params.merge!({title: '', body: 'aa'})
          is_expected.to eq 422
        end
      end
    end
  end

  describe 'PATCH /todos/:id' do
    let!(:todo) { create(:todo) }
    let(:id) { todo.id }

    context '正しいパラメータの時' do
      let(:update_attributes) { {title: 'update_title', body: 'update_body'} }

      it 'return 200 Todoが更新される' do
        params.merge!(update_attributes)
        is_expected.to eq 200
        expect(response.body).to be_json_as(
          todo: {id: todo.id, title: update_attributes[:title], body: update_attributes[:body]}
        )
      end

      it 'return 200 params[:title]が送られなくても更新される' do
        params.merge!({body: 'update_body'})
        is_expected.to eq 200
        expect(response.body).to be_json_as(
          todo: {id: todo.id, title: todo.title, body: 'update_body'}
        )
      end

    end

    context '不正なパラメータの時' do
      context 'パスパラメータのidが不正' do
        let(:id) { 'invalid' }

        it 'return exception ひとつもTodoがなくエラーがレスポンスされる' do
          expect { is_expected }.to raise_error ActiveRecord::RecordNotFound
        end

        it 'return exception Todoが存在するがエラーがレスポンスされる' do
          create(:todo)
          expect { is_expected }.to raise_error ActiveRecord::RecordNotFound
        end
      end

      context '更新するPOSTパラメータが不正' do
        it 'return 422 params[:title]が空の時は更新されずエラーがレスポンスされる' do
          params.merge!({title: '', body: 'aa'})
          is_expected.to eq 422
        end
      end
    end
  end


  describe 'DELETE /todos/:id' do
    context '正しいパラメータの時' do
      let!(:todo) { create(:todo) }
      let(:id) { todo.id }

      it 'return 204 Todoが削除される' do
        expect {
          is_expected.to eq 204
        }.to change{ Todo.count }.from(1).to(0)
      end
    end

    context '不正なパラメータの時' do
      context 'パスパラメータのidが不正' do
        let(:id) { 'invalid' }

        it 'return exception ひとつもTodoがなくエラーがレスポンスされる' do
          expect { is_expected }.to raise_error ActiveRecord::RecordNotFound
        end

        it 'return exception Todoが存在するがエラーがレスポンスされる' do
          create(:todo)
          expect { is_expected }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

end
