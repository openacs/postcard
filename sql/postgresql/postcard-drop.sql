


drop table postcard_images;
drop trigger postcard_images_lob_trigger;
drop table postcards;
drop sequence postcard_seq;
drop sequence postcard_image_seq;


-- Drop permission metadata
delete from acs_permissions
    where privilege in
        ('postcard_create_card', 'postcard_create_image',
        'postcard_read', 'postcard_admin');


delete from acs_privilege_hierarchy
    where privilege in
        ('postcard_create_card', 'postcard_create_image',
        'postcard_read', 'postcard_admin');

delete from acs_privilege_hierarchy
    where child_privilege in
        ('postcard_create_card', 'postcard_create_image',
        'postcard_read', 'postcard_admin');

delete from acs_privileges
    where privilege in
        ('postcard_create_card', 'postcard_create_image',
        'postcard_read', 'postcard_admin');



