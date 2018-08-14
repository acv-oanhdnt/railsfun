require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:products) { create_list(:product, 3) }
  let!(:product_attr) { attributes_for(:product) }

  describe "#index" do
    # it 'get list products' do
    #   get :index
    #   expect(assigns(:products).size).to eq products.size
    # end
  end

  describe "#show" do
    it 'show a product' do
      get :show, params: { id: products.first.id }
      expect(assigns(:product)).to eq products.first
      expect(response).to render_template :show
    end
  end

  describe "#new" do
    it 'render form new' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'get new item' do
      product = build(:product)
      get :new
      expect(assigns(:product)).to be_a_new Product
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "creates a new product" do
        expect{
          post :create, params: { product: product_attr }
        }.to change{ Product.count }.by(1)
      end

      it "redirects to the new contact" do
        post :create, params: { product: product_attr }
        expect(
          response
        ).to redirect_to products_path
      end
    end

    context "with invalid attributes" do
      it "creates a new product" do
        expect{
          post :create, params: { product: { description: 'short' } }
        }.to change{ Product.count }.by(0)
      end

      it "redirects to the new product" do
        post :create, params: { product: { description: 'short' } }
        expect(
          response
        ).to render_template :new
      end
    end
  end

  describe "#edit" do
    it 'render form new' do
      get :edit, params: { id: products.first.id }
      expect(response).to render_template :new
    end
    it 'get new item' do
      get :edit, params: {id: products.first.id}
      expect(assigns(:product).id).to eq products.first.id
    end
  end

  describe "#update" do
    it 'updated product' do
      product = products.last
      put :update, params: { id: product.id, product: {title: 'Update'} }
      product.reload
      expect(product.title).to eq 'update'
    end
  end

  describe '#destroy' do
    it 'success' do
      expect{products.first.destroy}.to change { Product.count }.by(-1)
      delete :destroy, params: { id: products.second.id }
      expect {Product.find(products.second.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
