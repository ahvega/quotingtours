# coding=utf-8
# from __future__ import unicode_literals
import os
from django.conf.locale.es import formats as es_formats


es_formats.DATETIME_FORMAT = "d M Y H:i:s"
es_formats.DECIMAL_SEPARATOR = ','
es_formats.THOUSAND_SEPARATOR = '.'
es_formats.NUMBER_GROUPING = 3

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '4w(^@j6u9786x@b2s9lpxx61uid@7l_yw!c9hbxmmua^rd93ew'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = [
    u'*.quotingtours.com',
    u'demo.quotingtours.com',
    u'107.180.103.216',
    u'demo.mistenants.com',
    u'mistenants.com',
    u'shorexplan.com',
    u'192.168.0.21',
]

INTERNAL_IPS = [
    '127.0.0.1',
    ]

# Application definition
SHARED_APPS = (
    'tenant_schemas',  # mandatory, should always be before any django app
    'clientes',  # you must list the app where your tenant model resides in

    'django.contrib.contenttypes',

    # everything below here is optional
    'suit',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'debug_toolbar',
    # 'djchoices',
    'bootstrap3',
    'crispy_forms',
    'rest_framework',
    'django_filters',
    'rest_framework.authtoken',
    'rest_framework_docs',
    'rest_framework_xml',
    'rest_framework_jwt',
    'corsheaders',
    'googlemaps',
    'transporte',
)

TENANT_APPS = (
    'suit',
    'django.contrib.admin',
    'django.contrib.admindocs',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',

    # your tenant-specific apps
    # 'djchoices',
    'bootstrap3',
    'crispy_forms',
    'rest_framework',
    'rest_framework.authtoken',
    'rest_framework_docs',
    'rest_framework_xml',
    'rest_framework_jwt',
    'django_filters',
    'corsheaders',
    'googlemaps',
    'transporte',
)

INSTALLED_APPS = [
    'tenant_schemas',
    'clientes',
    'suit',
    'django.contrib.admin',
    'django.contrib.admindocs',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'debug_toolbar',
    # 'djchoices',
    'bootstrap3',
    'crispy_forms',
    'rest_framework',
    'rest_framework.authtoken',
    'rest_framework_docs',
    'rest_framework_xml',
    'rest_framework_jwt',
    'django_filters',
    'corsheaders',
    'googlemaps',
    'transporte',
]

# Django Suit configuration example
SUIT_CONFIG = {
    # header
    'ADMIN_NAME': u'Administración - Cotizaciones de Transporte',
    # 'HEADER_DATE_FORMAT': 'l, j. F Y',
    # 'HEADER_TIME_FORMAT': 'H:i',

    # forms
    # 'SHOW_REQUIRED_ASTERISK': True,  # Default True
    # 'CONFIRM_UNSAVED_CHANGES': True, # Default True

    # menu
    # 'SEARCH_URL': '/admin/auth/user/',
    # 'MENU_ICONS': {
    #    'sites': 'icon-leaf',
    #    'auth': 'icon-lock',
    # },
    # 'MENU_OPEN_FIRST_CHILD': True, # Default True
    # 'MENU_EXCLUDE': ('auth.group',),
    # 'MENU': (
    #     'sites',
    #     {'app': 'auth', 'icon':'icon-lock', 'models': ('user', 'group')},
    #     {'label': 'Settings', 'icon':'icon-cog', 'models': ('auth.user', 'auth.group')},
    #     {'label': 'Support', 'icon':'icon-question-sign', 'url': '/support/'},
    # ),

    # misc
    # 'LIST_PER_PAGE': 15
}

DATABASE_ROUTERS = (
    'tenant_schemas.routers.TenantSyncRouter',
)

MIDDLEWARE_CLASSES = [
    'tenant_schemas.middleware.TenantMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    # 'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'corsheaders.middleware.CorsPostCsrfMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'transporte.middleware.corsMiddleware'
]

# CORS Config
CORS_ORIGIN_ALLOW_ALL = True
CORS_ALLOW_CREDENTIALS = False
CORS_REPLACE_HTTPS_REFERER = True
CORS_ORIGIN_WHITELIST = [
    'localhost',
    'resttesttest.com',
]
# CORS_ORIGIN_REGEX_WHITELIST = [
#     'localhost:3030',
# ]
CORS_ALLOW_METHODS = [
    'DELETE',
    'GET',
    'OPTIONS',
    'PATCH',
    'POST',
    'PUT',
]
CORS_ALLOW_HEADERS = [
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
]
TENANT_MODEL = "clientes.Cliente"  # app.Model

ROOT_URLCONF = 'tenant.urls'
FORMAT_MODULE_PATH = 'tenant.formats'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'transporte/templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'tenant.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'tenant_schemas.postgresql_backend',
        'NAME': 'transporte',
        'USER': 'postgres',
        'PASSWORD': 'honduras',
        'HOST': 'localhost',
        'PORT': '',
        # 'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

DEFAULT_FILE_STORAGE = 'tenant_schemas.storage.TenantFileSystemStorage'

# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

USE_I18N = True

# USE_L10N = True

LANGUAGE_CODE = 'es-mx'

NUMBER_GROUPING = 3
USE_THOUSAND_SEPARATOR = True

TIME_ZONE = 'America/Tegucigalpa'

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/

STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(BASE_DIR, 'static/')

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'assets'),
]

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    # 'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')

LOGIN_REDIRECT_URL = '/'

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        # 'rest_framework.permissions.IsAdminUser',
        # 'rest_framework.permissions.AllowAny',
        'rest_framework.permissions.IsAuthenticated',
    ],
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework.authentication.BasicAuthentication',
        # 'rest_framework.authentication.SessionAuthentication',
        # 'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
    ],
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
        # 'rest_framework_xml.renderers.XMLRenderer',
    ],
    'DEFAULT_PARSER_CLASSES': [
        'rest_framework.parsers.JSONParser',
        'rest_framework_xml.parsers.XMLParser',
    ],
    'DEFAULT_FILTER_BACKENDS': [
        'django_filters.rest_framework.DjangoFilterBackend',
    ],
    # 'PAGE_SIZE':                  10
}
