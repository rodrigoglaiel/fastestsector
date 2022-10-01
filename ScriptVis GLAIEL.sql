use library;

create or replace view universities_by_country as
		(select library.country.code as country, count(library.university.id) as count_universities
        from library.country
        join library.university on library.country.id = library.university.country_id
        group by library.country.code);

select * from universities_by_country
order by count_universities desc;

create or replace view users_by_careers as
		(select count(library.users.id) as count_users, library.careers.short_name
        from library.users
        join library.careers on library.users.career_id = library.careers.id
        group by library.careers.short_name);

select * from users_by_careers
order by count_users desc;

create or replace view files_by_career as
		(select count(library.files.id) as count_files, library.careers.short_name as career
        from library.files
        join library.subjects on library.files.subject_id = library.subjects.id
        join library.career_subject on library.subjects.id = library.career_subject.subject_id
        join library.careers on library.career_subject.career_id = library.careers.id
        group by library.careers.short_name);
        
select * from files_by_career;

create or replace view files_by_category as
		(select count(library.files.id) as count_files, library.category.name
        from library.files
        join library.category on library.files.category_id = library.category.id
        group by library.category.name
        order by count(library.files.id) desc);
        
select * from files_by_category;

create or replace view new_files_by_month as
		(select count(library.files.id) as new_files, monthname(library.files.created_at) as month, year(library.files.created_at) as year
        from library.files
        where library.files.deleted_at is null
        group by monthname(library.files.created_at), year(library.files.created_at)
        order by year(library.files.created_at) desc, monthname(library.files.created_at) desc);
        
select * from new_files_by_month;

create or replace view new_users_by_month as
		(select count(library.users.id) as new_users, monthname(library.users.created_at) as month, year(library.users.created_at) as year
        from library.users
        where library.users.deleted_at is null
        group by monthname(library.users.created_at), year(library.users.created_at)
        order by year(library.users.created_at) desc, monthname(library.users.created_at) desc);

select * from new_users_by_month;
