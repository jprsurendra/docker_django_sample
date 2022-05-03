from django.http import HttpResponse

def helloView(request):
    return HttpResponse("Hello, World!")