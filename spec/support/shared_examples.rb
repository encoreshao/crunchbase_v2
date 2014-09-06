shared_examples 'pagination' do
  its(:per_page) { should eq(1000) }
  its(:current_page) { should eq(1) }
end

shared_examples 'a container' do |count|
  it 'has correct number of items' do
    expect(subject.items.count).to eq(count)
  end
end
