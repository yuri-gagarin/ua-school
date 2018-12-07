require 'rails_helper'
require 'faker'

RSpec.describe CoursesController, type: :controller do
    let (:student) {User.create!(name: 'Student', last_name: 'Student', email: Faker::Internet.email('student'), password: "password", confirmed_at: Time.now, role: 1)}
    let (:teacher) {User.create!(name: 'Teacher', last_name: 'Teacher', email: Faker::Internet.email('teacher'), password: "password", confirmed_at: Time.now, role: 2)}
    let (:other_teacher) {User.create!(name: 'Other', last_name: 'Other', email: Faker::Internet.email('other'), password: "password", confirmed_at: Time.now, role: 2)}
    let (:admin) {User.create!(name: 'Admin', last_name: 'Admin', email: Faker::Internet.email('admin'), password: "password", confirmed_at: Time.now, role: 3)}
    let (:my_course) {Course.create!(name: Faker::Lorem.word, description: Faker::Lorem.paragraph(4), user_id: teacher.id)}
    let (:other_course) {Course.create!(name: Faker::Lorem.word, description: Faker::Lorem.paragraph(4), user_id: other_teacher.id)}

  context 'guest' do
    describe "GET index" do 
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do 
      it "returns http success" do
        get :show, params: {id: my_course.id}
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do 
        get :show, params: {id: my_course.id}
        expect(response).to render_template :show 
      end
      it "assigns my_course to @course" do 
        get :show, params: {id: my_course.id}
        expect(assigns(:course)).to eq(my_course)
      end

    end

    describe "GET new" do 
      it "returns http redirect" do 
        get :new 
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST create" do 
      it "returns http redirect" do 
        post :create, params: {course: {name: Faker::Lorem.name, description: Faker::Lorem.paragraph(4), user_id: teacher.id}}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do 
      it "returns http redirect" do 
        get :edit, params: {id: my_course.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT  update" do 
      it "returns http  redirect" do 
        new_course_name = Faker::Lorem.word 
        new_course_description = Faker::Lorem.paragraph(3)

        put :update, params: {id: my_course.id, course: {name: new_course_name, description: new_course_description} }

      end
    end

    describe "DELETE destroy" do 
      it "returns http redirect" do 
        delete :destroy, params: {id: my_course.id}
        expect(response).to redirect_to(new_user_session_path)
      end 
    end

  # end of unregistered guest test
  end

  context 'student' do
    before do
      student = User.create!(name: 'Student', last_name: 'Student', email: Faker::Internet.email('student'), password: "password", confirmed_at: Time.now, role: 1)
      sign_in student
    end

    describe "GET new" do 
      it "returns http redirect" do 
        get :new 
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET index" do 
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do 
      it "returns http success" do
        get :show, params: {id: my_course.id}
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do 
        get :show, params: {id: my_course.id}
        expect(response).to render_template :show 
      end
      it "assigns my_course to @course" do 
        get :show, params: {id: my_course.id}
        expect(assigns(:course)).to eq(my_course)
      end

    end

    describe "POST create" do 
      it "returns http redirect" do 
        post :create, params: { course: {name: Faker::Lorem.name, description: Faker::Lorem.paragraph(4), user_id: teacher.id} }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do 
      it "returns http redirect" do 
        get :edit, params: {id: my_course.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT  update" do 
      it "returns http  redirect" do 
        new_course_name = Faker::Lorem.word 
        new_course_description = Faker::Lorem.paragraph(3)

        put :update, params: {id: my_course.id, course: {name: new_course_name, description: new_course_description} }

      end
    end

    describe "DELETE destroy" do 
      it "returns http redirect" do 
        delete :destroy, params: {id: my_course.id}
        expect(response).to redirect_to(new_user_session_path)
      end 
    end
  #end of student user test
  end

  context 'teacher' do   
    before do 
      sign_in teacher
    end
    describe "GET index" do 
      it "returns http status success" do 
        get :index 
        expect(response).to have_http_status(:success)
      end 
    end

    describe "GET new" do 
      it "returns http status success" do 
        get :new 
        expect(response).to have_http_status(:success)
      end 

      it "instantiates @course" do 
        get :new 
        expect(assigns(:course)).not_to be_nil
      end
    end 

    describe "POST create" do 
      it "increases the number of Course by 1" do 
        expect{ post :create, params: {course: {name: Faker::Lorem.word, description: Faker::Lorem.paragraph(3), user_id: teacher.id}}}.to change(Course, :count).by(1)
      end

      it "assigns the new course to @course" do 
        post :create, params: {course: {name: Faker::Lorem.name, description: Faker::Lorem.paragraph(3), user_id: teacher.id}}
        expect(assigns(:course)).to eq(Course.last)
      end 
    end

    context 'teacher doing UPDATES on course they own' do 

      describe "GET edit" do 
        it "returns http status success" do
          get :edit, params: {id: my_course.id}
          expect(response).to have_http_status(:success)
        end

        it "assigns course to be updated to @course" do 
          get :edit, params: {id: my_course.id}
          course_instance = assigns(:course)
          expect(course_instance.id).to eq(my_course.id)
          expect(course_instance.name).to eq(my_course.name)
          expect(course_instance.description).to eq(my_course.description)
        end
      end

      describe "PUT update" do 
        it "successfully updates their course" do 
          new_name = Faker::Lorem.word
          new_description = Faker::Lorem.paragraph(3)
          put :update, params: {id: my_course.id, name: new_name, description: new_description}

          updated_course = assigns(:course)

          expect(updated_course.id).to eq(my_course.id)
          expect(updated_course.name).to eq(my_course.name)
          expect(updated_course.description).to eq(my_course.description)
        end

        it "redirects to courses#index" do 
          new_name = Faker::Lorem.word
          new_description = Faker::Lorem.paragraph(3)
          put :update, params: {id: my_course.id, name: new_name, description: new_description}
          expect(response).to redirect_to(courses_path)
        end
      end
    end

    context 'teacher doing UPDATES on course they dont own' do 

      describe "GET edit" do 
        it "returns http redirect" do
          get :edit, params: {id: other_course.id}
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "PUT update" do 
        it "returns http redirect" do 
          new_name = Faker::Lorem.word 
          new_description = Faker::Lorem.paragraph(3)

          put :update, params: {id: other_course.id, name: new_name, description: new_description}
          expect(response).to redirect_to(new_user_session_path)
        end
      end

    end

    describe "DELETE destroy" do 
      it "returns http redirect" do 
        delete :destroy, params: {id: my_course.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  # end of teacher course tests
  end

  context 'admin' do 
    before do 
      #admin = User.create!(name: 'Admin', last_name: 'Admin', email: Faker::Internet.email('admin'), password: "password", confirmed_at: Time.now, role: 3)
      sign_in admin 
    end

    describe "GET index" do 
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do 
      it "returns http success" do
        get :show, params: {id: my_course.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do 
        get :show, params: {id: my_course.id}
        expect(response).to render_template :show 
      end

      it "assigns my_course to @course" do 
        get :show, params: {id: my_course.id}
        expect(assigns(:course)).to eq(my_course)
      end
    end

    describe "POST create" do 
      it "increses the number of Course by 1" do
        expect{ post :create, params: {course: {name: Faker::Lorem.name, description: Faker::Lorem.paragraph(4), user_id: teacher.id}}}.to change(Course, :count).by(1)
      end

      it "credirecs to courses#index" do 
        post :create, params: {course: {name: Faker::Lorem.name, description: Faker::Lorem.paragraph(4), user_id: teacher.id}}
        expect(response).to redirect_to(courses_path)
      end
    end

    describe "GET edit" do 
      it "returns http success" do
        get :edit, params: {id: my_course.id}
        expect(response).to have_http_status(:success)
      end

      it "assigns course to be updated to @course" do 
        get :edit, params: {id: my_course.id}
        course_instance = assigns(:course)
        expect(course_instance.id).to eq my_course.id 
        expect(course_instance.name).to eq my_course.name 
        expect(course_instance.description).to eq my_course.description
      end
    end

    describe "PUT  update" do 
      it "updates the course information" do 
        new_course_name = Faker::Lorem.word 
        new_course_description = Faker::Lorem.paragraph(3)

        patch :update, params: {course: {id: my_course.id, name: new_course_name, description: new_course_description}}

        updated_course = assigns(:course)
        expect(updated_course.name).to eq new_course_name
        expect(updated_course.description).to eq new_course_description
      end

      it "redirects to courses#index" do 
        new_course_name = Faker::Lorem.word 
        new_course_description = Faker::Lorem.paragraph(3)

        patch :update, id: my_course.id, course: {name: new_course_name, description: new_course_description}
        expect(response).to redirect_to(courses_path)
      end
    end


    describe "DELETE destroy" do 
      it "deletes the course" do 
        delete :destroy, params: {id: my_course.id}
        course_count = Course.where({id: my_course.id})
        expect(course_count.size).to eq 0 
      end 

      it "redirects to courses#idex" do 
        delete :destroy, params: {id: my_course.id}
        expect(response).to redirect_to(courses_path)
      end
    end
  #end of admin test
  end

end
