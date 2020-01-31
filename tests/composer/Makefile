composer:
	mv composer.lock composer.lock~
	COMPOSER_MEMORY_LIMIT=-1 composer install --profile --ignore-platform-reqs --no-scripts
	rm -rf vendor/
	diff composer.lock composer.lock~ || exit 1;
	rm composer.lock~
