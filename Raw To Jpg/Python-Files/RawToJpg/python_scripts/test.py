from win10toast import ToastNotifier
import rawpy
import imageio
import os

def show_notification(title, message):
    toaster = ToastNotifier()
    toaster.show_toast(title, message, duration=10)

def convert_to_jpg(file_path,title, message):
    raw = rawpy.imread(file_path)
    rgb = raw.postprocess()
    imageio.imsave(file_path.replace('.CR3', '.jpg'), rgb)
    show_notification(title, message)
#show_notification("Start", "this starts the function")

def convert_cr3_to_image(filename, output_format,title, message):
    show_notification(title, message)
    show_notification(filename, output_format)

    #with rawpy.imread(filename) as raw:
    #    rgb = raw.postprocess()
    #output_filename = f"{filename[:-4]}.{output_format}"
    #imageio.imwrite(output_filename, rgb)