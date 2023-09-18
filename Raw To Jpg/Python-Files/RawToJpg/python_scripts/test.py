from win10toast import ToastNotifier
import rawpy
import imageio
import os

def show_notification(title, message):
    toaster = ToastNotifier()
    toaster.show_toast(title, message, duration=10)
show_notification("update", "this is the update")
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

def let_the_5AM_maddnes_come_out(file,output_format):
    toaster = ToastNotifier()
    file = "C:\Users\Kire\Downloads\IMG_0799.CR3"
    try:
        
        toaster.show_toast("concrats", "it looks like it will work", duration=10)
        with rawpy.imread(file) as raw:
            rgb = raw.postprocess()
        output_filename = f"{os.path.splitext(file)[0]}.{output_format}"
        imageio.imwrite(output_filename, rgb)
        #save the file as jpg
    except:
        toaster.show_toast("Error", "it looks like it will not work", duration=10)
        print("Error")
        print(file)