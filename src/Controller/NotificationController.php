<?php
// src/Controller/NotificationController.php
namespace App\Controller;

use App\Entity\Notification;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class NotificationController extends AbstractController
{
    #[Route('/admin/create-notification', name: 'app_create_notification')]
    public function createNotification(Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($request->isMethod('POST')) {
            // Récupération des données du formulaire
            $title = $request->request->get('notification_title');
            $body = $request->request->get('notification_body');
            
            // Création de l'objet Notification
            $notification = new Notification();
            $notification->setTitle($title);
            $notification->setBody($body);
            $notification->setCreatedAt(new \DateTime());

            // Enregistrement dans la base de données
            $entityManager->persist($notification);
            $entityManager->flush();

            // Ajouter un message flash pour informer l'utilisateur
            $this->addFlash('success', 'Notification créée avec succès !');

            // Redirection vers la page de création de notification
            return $this->redirectToRoute('app_gerernotifications');
        }

        return $this->render('admin/creer_notification.html.twig');
    }
    #[Route('/notificationedit{id}', name: 'app_modifiernotif')]
    public function edit(int $id, Request $request, EntityManagerInterface $entityManager): Response
    {
        // Trouver la notification à modifier
        $notification = $entityManager->getRepository(Notification::class)->find($id);

        if (!$notification) {
            throw $this->createNotFoundException('Notification not found');
        }

        // Traitement du formulaire
        if ($request->isMethod('POST')) {
            $title = $request->request->get('notification_title');
            $body = $request->request->get('notification_body');

            if ($title !== null) {
                $notification->setTitle($title);
            }

            if ($body !== null) {
                $notification->setBody($body);
            }

            // Mettre à jour la date (optionnel)
            $notification->setCreatedAt(new \DateTime());

            // Sauvegarder les changements dans la base de données
            $entityManager->flush();

            // Rediriger après la modification
            return $this->redirectToRoute('app_gerernotifications');
        }

        // Afficher le formulaire de modification
        return $this->render('admin/modification_notification.html.twig', [
            'notification' => $notification,
        ]);
    }

    #[Route('/notification/delete/{id}', name: 'app_delete_notification', methods: ['POST'])]
    public function delete(int $id, EntityManagerInterface $entityManager): RedirectResponse
    {
        // Trouver la notification à supprimer
        $notification = $entityManager->getRepository(Notification::class)->find($id);

        if ($notification) {
            // Supprimer la notification
            $entityManager->remove($notification);
            $entityManager->flush();
        }

        // Rediriger vers une autre page après suppression
        return $this->redirectToRoute('app_gerernotifications');
    }
}
