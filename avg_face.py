from facer import facer
import matplotlib.pyplot as plt

# Load face images
path_to_images = "./face_images"
images = facer.load_images(path_to_images)

# Detect landmarks for each face
landmarks, faces = facer.detect_face_landmarks(images)

# Use  the detected landmarks to create an average face
average_face = facer.create_average_face(faces, landmarks, save_image=True)

# View the composite image
plt.imshow(average_face)
plt.savefig('output.png')