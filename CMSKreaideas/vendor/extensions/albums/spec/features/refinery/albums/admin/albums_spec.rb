# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Albums" do
    describe "Admin" do
      describe "albums" do
        refinery_login_with :refinery_user

        describe "albums list" do
          before do
            FactoryGirl.create(:album, :name => "UniqueTitleOne")
            FactoryGirl.create(:album, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.albums_admin_albums_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.albums_admin_albums_path

            click_link "Add New Album"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Albums::Album.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Albums::Album.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:album, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.albums_admin_albums_path

              click_link "Add New Album"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Albums::Album.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:album, :name => "A name") }

          it "should succeed" do
            visit refinery.albums_admin_albums_path

            within ".actions" do
              click_link "Edit this album"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:album, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.albums_admin_albums_path

            click_link "Remove this album forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Albums::Album.count.should == 0
          end
        end

      end
    end
  end
end
